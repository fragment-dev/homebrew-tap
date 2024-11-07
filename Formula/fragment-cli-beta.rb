require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5750.0.0-darwin-x64.tar.gz"
    sha256 "2ee5e154d27d9571b3105784e4131809f2d07857632c8dbb670fa5406653b0ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5750.0.0-darwin-arm64.tar.gz"
      sha256 "906237f11c23a5fc19c70464ee3b3ec8a2ae4ddbe166234f0839e55b0900a8d3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5750.0.0-linux-x64.tar.gz"
    sha256 "406bfd61b4173f68170b11307a8494af9bce423caeb7c1ad3136c919fa81a9ea"
  end
  version "5750.0.0"
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
