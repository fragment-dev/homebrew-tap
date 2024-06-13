require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5271.0.0-darwin-x64.tar.gz"
    sha256 "c7b45b7082a1c81a732e0ed436a111a5d425886e19d2b844456399fb859a5141"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5271.0.0-darwin-arm64.tar.gz"
      sha256 "b23b76c78b8ff7a6f47ee11a7e487689f8d2a7a6a551543c27c4433d6e5c6ea9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5271.0.0-linux-x64.tar.gz"
    sha256 "04cb9b88fe8d36d6d2e4118a8b30293a153a812e4537bb3c56ff9ab1a58019b9"
  end
  version "5271.0.0"
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
