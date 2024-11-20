require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5805.0.0-darwin-x64.tar.gz"
    sha256 "64c2935a5a5f4f8c26dc9a49687b7f0727c7f4b8438cf25c5b63d3de0d798bcb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5805.0.0-darwin-arm64.tar.gz"
      sha256 "a554c88d80f7ae1ec5c308dd856c89b526fce4d20eb5c118f4ce804d7b5e5789"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5805.0.0-linux-x64.tar.gz"
    sha256 "27989fa075f9aa884b1ed31222e38dcd4e24fc7355e06b6d35384bde4dda01db"
  end
  version "5805.0.0"
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
