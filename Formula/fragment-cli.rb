require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.22-darwin-x64.tar.gz"
    sha256 "966355c39f7ed4bed022202a2202365558f00e8e3712b95d1c0c619847432fc8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.22-darwin-arm64.tar.gz"
      sha256 "10351b700f0f4b85c1628eb6ded84279bdf5508fb3a2be66a2465121fcbd50af"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.22-linux-x64.tar.gz"
    sha256 "70181df1e17f18a28f41f11f6bdf8bcc50a3c4e32c92fe9b4b7d12071f81b7fe"
  end
  version "2023.3.22"
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
