require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4914.0.0-darwin-x64.tar.gz"
    sha256 "939506eb0af26555a752e2844d1ed1612ee713dc76702aae497f22848ce59573"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4914.0.0-darwin-arm64.tar.gz"
      sha256 "4332a2fc3fddbb8947c8ebb5c77f26b3c2c58baee0fe5147b593b1b0da311dce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4914.0.0-linux-x64.tar.gz"
    sha256 "472c33263c662f1cf8151f6baac40c5de30eb9281a6972da40557fe760cf99e1"
  end
  version "4914.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
