require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4278.0.0-darwin-x64.tar.gz"
    sha256 "e085c8342eef671b72c1a146878f742ed39a29ec433a1757f6872687cdd9016e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4278.0.0-darwin-arm64.tar.gz"
      sha256 "e5b52fa87a8c35ce1e322193eb1486650786abedfcdf4913244f4b6644d8b392"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4278.0.0-linux-x64.tar.gz"
    sha256 "45b7ddf85e5da660582b037eb1d1cad8fff33c0f38049ce136ba1f1ed8264bbd"
  end
  version "4278.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
