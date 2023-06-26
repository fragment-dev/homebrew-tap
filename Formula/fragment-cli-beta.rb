require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2929.0.0-darwin-x64.tar.gz"
    sha256 "2689d049c07b44599962dd2dc13bb526b699394d34331082ee41adbf9fecf7ea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2929.0.0-darwin-arm64.tar.gz"
      sha256 "e8eb1480f198af005f3d8e0f1e380a8b265fa478b29aa603b42abc606a06f2c0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2929.0.0-linux-x64.tar.gz"
    sha256 "b49b9dc41201bb1801a00a04974582b18f55f669a8fc7b13e5e0071889e3e966"
  end
  version "2929.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
