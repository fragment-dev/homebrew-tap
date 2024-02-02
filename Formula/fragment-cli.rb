require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.2-1-darwin-x64.tar.gz"
    sha256 "751e80c92a03ca1d297754dbca1222f634f90c28bac28c4a71ffa98bd175f341"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.2-1-darwin-arm64.tar.gz"
      sha256 "2e3c0bd3c84b6400dd230c8b9a647846fef5dd37417b324b76ef2473e44de0b7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.2-1-linux-x64.tar.gz"
    sha256 "82ee850c2a629b1724587446791eb7c646541506040d5e9620567e4bb319d06d"
  end
  version "2024.2.2-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
