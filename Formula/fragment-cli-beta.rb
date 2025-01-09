require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6059.0.0-darwin-x64.tar.gz"
    sha256 "4bdd542669536e48bd345473b74939f47089ca95e0253788db4244fe080805be"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6059.0.0-darwin-arm64.tar.gz"
      sha256 "887e49d99dd4583d204a0df53d311c5d18761f087e6cd9782324abba23956d19"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6059.0.0-linux-x64.tar.gz"
    sha256 "b3a8cfd8b6537e2a58848edae18e69d742fd28a02ae7c7749697932742dc76a0"
  end
  version "6059.0.0"
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
