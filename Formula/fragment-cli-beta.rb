require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3152.0.0-darwin-x64.tar.gz"
    sha256 "f9d3628cc87903303ac124827fbb11fb1d6aac15af7f9c49b0ba653afd642242"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3152.0.0-darwin-arm64.tar.gz"
      sha256 "c03a97ec040e3d2a298e633371c11e1327378e1a9e3eb30500f9c1b03c770eee"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3152.0.0-linux-x64.tar.gz"
    sha256 "c45d80a6d9549f4e65d927e139be9f76b19c7820502b505797a68c687136cfda"
  end
  version "3152.0.0"
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
