require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5325.0.0-darwin-x64.tar.gz"
    sha256 "17c993fc3494eba0590312dde0fce046d517431f84e72abaf90bba8c400cd863"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5325.0.0-darwin-arm64.tar.gz"
      sha256 "3dd4797fab4f6e2e55ed6d7648826f215f9a109e77319adc22dda6fc9ed3676b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5325.0.0-linux-x64.tar.gz"
    sha256 "de9a0c435b9359032143eae4a012b6f007c28f8b98443a41f323ded8626a15dd"
  end
  version "5325.0.0"
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
