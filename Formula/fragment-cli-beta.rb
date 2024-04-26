require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4958.0.0-darwin-x64.tar.gz"
    sha256 "289842564e2954b7e7aa338225e48d721ed1908b8e9ea65e9877f0ad165ce94f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4958.0.0-darwin-arm64.tar.gz"
      sha256 "522d380bae4bb3d0a2fe3dac7d5319b61459b30b3fb9b7711ad3e1f94a937901"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4958.0.0-linux-x64.tar.gz"
    sha256 "b69c626414e7ea2a56cef9916a512f699bceafd06204b43aefeca8d55ffd0345"
  end
  version "4958.0.0"
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
