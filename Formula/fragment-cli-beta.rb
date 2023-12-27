require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4226.0.0-darwin-x64.tar.gz"
    sha256 "cf7175dadbbc3c10be703ce4b03bbd21e0165682e52abe85074eb33edf4e214f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4226.0.0-darwin-arm64.tar.gz"
      sha256 "38517a29ffb9c563a47e86cf1ada244484520da636a959d77d6df096394c7344"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4226.0.0-linux-x64.tar.gz"
    sha256 "0f17a4b09692dfbae99dfcc20b22f53cb4cd5f6cec1513e30a36839ae5de738c"
  end
  version "4226.0.0"
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
