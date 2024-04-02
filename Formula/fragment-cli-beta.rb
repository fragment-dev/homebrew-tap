require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4836.0.0-darwin-x64.tar.gz"
    sha256 "e66d51ec1637305a7df21b5ca94cd038dc84a44926115325ccaa7123575c7b19"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4836.0.0-darwin-arm64.tar.gz"
      sha256 "500821ff447725f8f290d79caa98b72882c1cac0eed7a533ae9868c4ac1db24f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4836.0.0-linux-x64.tar.gz"
    sha256 "fb10702f3e96091dadc1475e5aafcbb4baae0747aeec0de75d3ac38ebb8a7230"
  end
  version "4836.0.0"
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
