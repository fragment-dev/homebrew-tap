require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.9-1-darwin-x64.tar.gz"
    sha256 "0c64d3a40a0d26d596414d099715b6da5eb6763b049d06b01bef3d581f47ffeb"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.9-1-darwin-arm64.tar.gz"
      sha256 "6d65bbeb3cbaa78b04af30857eca19336a24aa6393670373f9b2abe0d24c6bcc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.9-1-linux-x64.tar.gz"
    sha256 "97d353422ad2db42d18564eb0ef8d5199a55ecf3fd32a0dbbcc8fdc456286e69"
  end
  version "2024.5.9-1"
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
