require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.14-1-darwin-x64.tar.gz"
    sha256 "9ca28a34c3782fe90eb2f568230d7dedf3cbfa988d862134ef93634258ac04cd"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.14-1-darwin-arm64.tar.gz"
      sha256 "37366fcb3e45949ef9e0f5f66a947e5cd732db2adc5b51a43c23b8c7b6fcafc0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.14-1-linux-x64.tar.gz"
    sha256 "c0ace9203d0a8a28bf878476b1c4ee332c7fd513a968b4d1fa6d0d6e715200dc"
  end
  version "2023.3.14-1"
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
