require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.18-darwin-x64.tar.gz"
    sha256 "c2442e484598c07a9319af64a0a5a7b92ba7c378d377af0a2733e2680ac20424"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.18-darwin-arm64.tar.gz"
      sha256 "f36b1a73a8297699de0f17b69a01e772688fc12d8444e6ad473dbabdee3cf3f3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.18-linux-x64.tar.gz"
    sha256 "a484604d91a2b9dad00e878c08ede2ca1ceb2d139928618eacc0b1d6eafca524"
  end
  version "2023.2.18"
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
