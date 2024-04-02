require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4834.0.0-darwin-x64.tar.gz"
    sha256 "4b6bca985453f68bd05d373ac533291c4e0019d7da353f7d0c5408f89de097c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4834.0.0-darwin-arm64.tar.gz"
      sha256 "f916291788d1393167b65a60bc34a9c763befe9efdcbde75e8f2e32df13b3c59"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4834.0.0-linux-x64.tar.gz"
    sha256 "6b7b11d4cd6245461231ffa092779286175fc0e7430e576f3861215ac6f4c8d2"
  end
  version "4834.0.0"
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
