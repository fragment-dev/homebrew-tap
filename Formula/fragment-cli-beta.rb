require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4390.0.0-darwin-x64.tar.gz"
    sha256 "9e319d02738c8c9918285d39bdee08bcb3223c18bd72b0ecea2528e9825c3cc1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4390.0.0-darwin-arm64.tar.gz"
      sha256 "5ae1327e2d7f9783cc5a01811aec654d66958d1efd227f73348e31237a4ff8c0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4390.0.0-linux-x64.tar.gz"
    sha256 "b02cc93ae89b6d8941ffea94ed3b3cfc7acf535995ca5c7e1b97d4a1bdc6160b"
  end
  version "4390.0.0"
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
