require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.6-darwin-x64.tar.gz"
    sha256 "08c345e4fb770115a3b99df4e3cebaee98a3c968a03439dcfd45fdabc1f21a9f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.6-darwin-arm64.tar.gz"
      sha256 "7e7bfa440a4df690ff5ddc495366986f4293a95651612fad356b806d1c47976e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.6-linux-x64.tar.gz"
    sha256 "d1aa7d29d9aabe83c3dbdfb8cd21d9acbbaf6a6273cb1684d1feb7389213c0d0"
  end
  version "2024.5.6"
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
