StoreInitializer =
    name: 'storeConvenienceInjector'
    before: 'session'
    after: 'store'
    initialize: (container, app) ->
        # inject store into components, because they act as their own controllers
        app.inject 'component', 'store', 'store:main'
        app.inject 'service:session', 'store', 'store:main'

        # convenience for development, shouldn't be relied in the app
        app.set 'store', container.lookup 'store:main'

`export default StoreInitializer`