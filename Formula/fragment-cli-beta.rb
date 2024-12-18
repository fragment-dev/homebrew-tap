require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5922.0.0-darwin-x64.tar.gz"
    sha256 "782d3b48116b6752c2be9f66c43cd429197a21715b953aba279ef3c0c2931437"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5922.0.0-darwin-arm64.tar.gz"
      sha256 "c89203741cceea2eaac490e8a24f4c2cf277a9ccb24d46a1613dfbe4ed32d5ba"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5922.0.0-linux-x64.tar.gz"
    sha256 "2f30a4c7b0e828c9a4f21677c6f1c70150ca0a6c16ecaa6bbd5922252618cfa6"
  end
  version "5922.0.0"
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
