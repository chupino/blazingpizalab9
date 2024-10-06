FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/MicrosoftDocs/mslearn-blazor-navigation.git BlazingPizza
WORKDIR BlazingPizza

RUN rm -rf pizza.db

COPY OrderController.cs .
COPY OrderState.cs .
COPY App.razor .
COPY PizzaStoreContext.cs .
COPY MainLayout.razor ./Shared/
COPY _Host.cshtml ./Pages/
COPY Checkout.razor ./Pages/
COPY Index.razor ./Pages/
COPY MyOrders.razor ./Pages/
COPY OrderDetail.razor ./Pages/

RUN dotnet restore
CMD dotnet run --urls="http://0.0.0.0:80"
