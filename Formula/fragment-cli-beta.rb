require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5116.0.0-darwin-x64.tar.gz"
    sha256 "0d699a7dd2e31593a8b65fa33be4354ea94eef9783a3a6c19438019a0c481435"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5116.0.0-darwin-arm64.tar.gz"
      sha256 "8ad6da003f064244b0531fbf59684bb5cf8782706fc41a87e39cfa02bc4440ed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5116.0.0-linux-x64.tar.gz"
    sha256 "7e770cdd509ec5988499ba3501d568e8a63a26d3e380edcb247d1410d620974c"
  end
  version "5116.0.0"
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
