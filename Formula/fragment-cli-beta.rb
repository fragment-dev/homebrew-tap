require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3301.0.0-darwin-x64.tar.gz"
    sha256 "e1caa60cd7ae364a629e4dbef27967851798dde543084bde3aa730bd098ebf5d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3301.0.0-darwin-arm64.tar.gz"
      sha256 "1af6085bbe457fd9c1d2f42eebcaf0bcbb3f87765f8c6d771bbe06315986e76d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3301.0.0-linux-x64.tar.gz"
    sha256 "25c3816ab6cb6e2950f36144405fdd7bd38c7a043abed9170b9b9ebb15c7b3c2"
  end
  version "3301.0.0"
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
