require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2914.0.0-darwin-x64.tar.gz"
    sha256 "37fc2ea8055484e36de250cb4b7a267830b98d0dd9a7f7c29a3b34923ca3c4d9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2914.0.0-darwin-arm64.tar.gz"
      sha256 "5161a320ab4737517a38fb5b14d20e1c89c4c966362dbf5f7c0004b501db2132"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2914.0.0-linux-x64.tar.gz"
    sha256 "068fdec9bcf4f6c9afe1db39c3cf3e49191d5c1cd2b62b3d82505fc1aacb0694"
  end
  version "2914.0.0"
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
