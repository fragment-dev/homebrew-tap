require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3733.0.0-darwin-x64.tar.gz"
    sha256 "141c30b639d0ba6e17c42b12d5d5bf8b2154182e21446927e11df5bac755c86a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3733.0.0-darwin-arm64.tar.gz"
      sha256 "acdcd9fc3a939ce2ffc2ab599f155000dd33426d03fad1326cb284d86f179777"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3733.0.0-linux-x64.tar.gz"
    sha256 "fefbb36de3131975b7e658ca1cc98449aea50b2c287f96f7eab1a8c0c1e2287f"
  end
  version "3733.0.0"
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
