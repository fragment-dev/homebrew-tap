require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5401.0.0-darwin-x64.tar.gz"
    sha256 "6ddbf21f7d5142504ca01b5161b682755d7bcc81296488882435b27a050632d3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5401.0.0-darwin-arm64.tar.gz"
      sha256 "acecf779d5edfc4911e85ae9e42ac648469198ca8344019f3302947af7e4182d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5401.0.0-linux-x64.tar.gz"
    sha256 "558be6ae1d29b2eb5ca5e312524ddfbd9ee41ed743dda53734494b65049cab09"
  end
  version "5401.0.0"
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
