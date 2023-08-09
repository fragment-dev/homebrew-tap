require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3272.0.0-darwin-x64.tar.gz"
    sha256 "3143e8a93fa7c951c183383b5425adf2e920244b59ff654258f236530ece482c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3272.0.0-darwin-arm64.tar.gz"
      sha256 "d26c06293aa8c50bf716a760b208ae5ced06bcca86e460dcbbb1b19548701b87"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3272.0.0-linux-x64.tar.gz"
    sha256 "18391447801f44e54695234e4e1ad2b7ab392aa95228ece75b70a4bbde118b5b"
  end
  version "3272.0.0"
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
