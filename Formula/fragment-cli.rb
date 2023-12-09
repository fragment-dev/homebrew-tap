require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.8-darwin-x64.tar.gz"
    sha256 "8c1bfe9583dcd538efdaaf580e2821d1413d3f4193af5c1ba15d66eb11058ac8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.8-darwin-arm64.tar.gz"
      sha256 "0bfd6632899cc565e680962d0536abd2bc2bb369459e4e358b07e81f62b00861"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.8-linux-x64.tar.gz"
    sha256 "17ff729aa29989abfd07016ed1bb818ad74ba2a642476f4225fff131eac26b99"
  end
  version "2023.12.8"
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
