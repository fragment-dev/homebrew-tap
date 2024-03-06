require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4717.0.0-darwin-x64.tar.gz"
    sha256 "30ff09394788dcc29d256169a36f07e0cd5c78e9ab184de1166c9dc2998190ff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4717.0.0-darwin-arm64.tar.gz"
      sha256 "278921f03dce9c4751eb0a47d4ac5ea7f28549a27e1dd5b5b61c151ab925a5a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4717.0.0-linux-x64.tar.gz"
    sha256 "21f1facde4b4733dccad8d744533ac0eb90e50b7a03f26971852d44dc0da7ae1"
  end
  version "4717.0.0"
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
