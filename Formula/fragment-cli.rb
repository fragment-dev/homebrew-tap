require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.4-darwin-x64.tar.gz"
    sha256 "c05f06108ac9a8773e8671ff4dabcaf9ddf172bc291802f97362dc2552d2b0a7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.4-darwin-arm64.tar.gz"
      sha256 "c9848a973b37f1b9d4e0fca94e4290ee77dacad13274bf60e92e455b1576b85c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.4-linux-x64.tar.gz"
    sha256 "564ecda42e0c28d061a5d3690f4d1ee39a9b728dfe0e61aa399f5832eca0d02d"
  end
  version "2023.7.4"
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
