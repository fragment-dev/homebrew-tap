require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5755.0.0-darwin-x64.tar.gz"
    sha256 "f232035bd72de9d7bb98ae0d08cdbbaa64a2f1e03cd6188d5f284220f43972f1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5755.0.0-darwin-arm64.tar.gz"
      sha256 "d755748b9c9d5bd5cee0ce52c9e666b688dfd37a491612c2dc5d5058230d4319"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5755.0.0-linux-x64.tar.gz"
    sha256 "9a4753178e9f04888af38517a87e540f88984d48470ddd16d2d9b501e8361f1f"
  end
  version "5755.0.0"
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
