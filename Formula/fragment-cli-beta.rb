require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5992.0.0-darwin-x64.tar.gz"
    sha256 "9391eeea26993c9fba6d24095ba662e4df22361f8e71ba467bbd1b660db466a0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5992.0.0-darwin-arm64.tar.gz"
      sha256 "e90ad97060148f59830299521a641b42a68de9568f39bb20678842d253fc4ed6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5992.0.0-linux-x64.tar.gz"
    sha256 "c75b36e58ddab2f9cb59855a336ce5d53ba6d8f2f7e444d8ce495b4766dedc52"
  end
  version "5992.0.0"
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
