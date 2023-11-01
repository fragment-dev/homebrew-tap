require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.3.0-darwin-x64.tar.gz"
    sha256 "b94d8b83191c5ff1e1556007ee470af0648e97ecf01d7e2bafcbaf786a8870b4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.3.0-darwin-arm64.tar.gz"
      sha256 "9c390514c83db043443330079cd3100e1b342046bc8208ce4e9072d80219cb4a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.3.0-linux-x64.tar.gz"
    sha256 "81518c953ee83132dd6dbc0e7527d3e62b9d512bb4f2e977aa4861e0f4b8b104"
  end
  version "3955.3.0"
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
