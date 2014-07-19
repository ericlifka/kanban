StoreInitializer =
    name: 'storeConvenienceInjector'
    after: 'store'
    initialize: (container, app) ->
        # convenience for development, shouldn't be used in the app
        store = container.lookup 'store:main'
        app.set 'store', store

`export default StoreInitializer`