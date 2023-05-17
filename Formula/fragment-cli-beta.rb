require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2690.0.0-darwin-x64.tar.gz"
    sha256 "2a94dec9f75229ef361c60ff2ffed504df377d0b6f53c42f94a9f46435daf7d0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2690.0.0-darwin-arm64.tar.gz"
      sha256 "faedbf9cadf3ec6f0903d2dab0a0b1b8f8ef2d387e0b0c9a78e229ba9fc40095"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2690.0.0-linux-x64.tar.gz"
    sha256 "001e14d3c0b3d6164b31cab6b2794c95d5d9f527eef5ee0032ae2c32553aa3c0"
  end
  version "2690.0.0"
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
