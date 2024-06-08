require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5244.0.0-darwin-x64.tar.gz"
    sha256 "b57645387244b2b9adaf806ee9ef7b1e4810253a896babc359345e0785b31859"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5244.0.0-darwin-arm64.tar.gz"
      sha256 "f6e75eaf3b369ec3f80b7c0a5adbd8c8c1f85493a2eec480364ab7c7f40551ee"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5244.0.0-linux-x64.tar.gz"
    sha256 "eb63bdcd2f40721bd35eebac1e91514bdb6a48e9ebf4f25210c95934bec013a5"
  end
  version "5244.0.0"
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
