require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2744.0.0-darwin-x64.tar.gz"
    sha256 "0cdb5bbfcf362f4e08284b651304113a89d566c6c7a1304b37561dbc1ad37c9f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2744.0.0-darwin-arm64.tar.gz"
      sha256 "b915d777af0a8c06b0e761ef156ffc8b1ac68e714af6a95c5965daebeb7f4fc1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2744.0.0-linux-x64.tar.gz"
    sha256 "4e3ba625af2c1169f13683a4fcbdeb486f906248d7d5292c7fe0bf2f6682edaf"
  end
  version "2744.0.0"
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
