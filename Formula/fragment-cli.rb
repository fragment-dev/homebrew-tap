require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.11-darwin-x64.tar.gz"
    sha256 "58815245133786cba55f930bba1edf6282788b9419d77615b1de553ea0d9bcce"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.11-darwin-arm64.tar.gz"
      sha256 "26c76c8b881a167c885bbb268c404d9ddb331b5b1dc13976dd522a62b80a204b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.11-linux-x64.tar.gz"
    sha256 "c4758e29b042a1d61ea0c50f729fb944035f8aa217fd8677fc22bc601ea6c61a"
  end
  version "2025.8.11"
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
