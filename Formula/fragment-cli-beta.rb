require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3897.0.0-darwin-x64.tar.gz"
    sha256 "5c6cd21606b6380cd24273a4eac7dd2e7aaf51268bda1f61c04eceb906f1f54b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3897.0.0-darwin-arm64.tar.gz"
      sha256 "a764a3a7984613b985870d1060d458205de3015257892332725b5c1bbd2b727d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3897.0.0-linux-x64.tar.gz"
    sha256 "e159ebc382735815f2c4bb4a6818665b0008528c53035a8b370cf136e9ce34d4"
  end
  version "3897.0.0"
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
