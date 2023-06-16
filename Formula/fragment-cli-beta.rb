require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2869.0.0-darwin-x64.tar.gz"
    sha256 "0dc4c3bc48d1d9660cbe70cc1a8216c70be0d270b96c30d1ba40edb6b37b0046"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2869.0.0-darwin-arm64.tar.gz"
      sha256 "50da2894f08030d2284a95e219252ad314f1d4f18834a3da91ed2751e934ce5a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2869.0.0-linux-x64.tar.gz"
    sha256 "6669b69378fc847d7ec6929257d17ac801611ad2cfd90cc3f3af948c39b88867"
  end
  version "2869.0.0"
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
