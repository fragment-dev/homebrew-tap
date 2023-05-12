require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2646.0.0-darwin-x64.tar.gz"
    sha256 "7ca2f220b7c9c2009d3723b8d354805d6e2c440190e208fd078b9447f4f68eca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2646.0.0-darwin-arm64.tar.gz"
      sha256 "b54a58b59d7eb2bc1a81cf52beb867dbca303eb207dd07269124aec7ff08edd5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2646.0.0-linux-x64.tar.gz"
    sha256 "39b5abf965e6a00841c720e6bac00e36314e4cf0791777bb9a98e042723150eb"
  end
  version "2646.0.0"
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
