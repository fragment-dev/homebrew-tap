require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.3-1-darwin-x64.tar.gz"
    sha256 "b59d33d626dbbd0202ad9fe4f4a99683ab0c831aca8b28df850bdd16361317bd"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.3-1-darwin-arm64.tar.gz"
      sha256 "60cfceff7aed1a8f294ab4424fdc63003c0ec49128e6b2abac099cd94631c56a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.3-1-linux-x64.tar.gz"
    sha256 "86977fa728c931844bf0aa2e9c881497011aad68a8daba1bdae6bb106c1501c5"
  end
  version "2025.1.3-1"
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
