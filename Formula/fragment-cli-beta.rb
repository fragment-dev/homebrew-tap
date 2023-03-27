require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2283.0.0-darwin-x64.tar.gz"
    sha256 "1367bd10136865dce100cc0bb5c1cca6ace7c8b014d4e6a371b30a98c7d6e8dd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2283.0.0-darwin-arm64.tar.gz"
      sha256 "05daa5140a6214d0f53cf68e1167cc350c082f6f1b6b336c9b33e4339575674f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2283.0.0-linux-x64.tar.gz"
    sha256 "f8479affab3299c6f4068b00d22e8b204760040aa18ed2827ea0a7aeeed70b9b"
  end
  version "2283.0.0"
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
