require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3133.0.0-darwin-x64.tar.gz"
    sha256 "5ddbfe4ba58315620c450ff38eb1f928b86faee14ec895c58ae6ebec6e624bf7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3133.0.0-darwin-arm64.tar.gz"
      sha256 "0bc37c66ad5f3faeef19f8fb4bf036d48aac61bb2cf4bc3d240aabe3c3193e40"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3133.0.0-linux-x64.tar.gz"
    sha256 "5e15d73c0d6546d8b6e594f69b9a4260a273f03c8dab3f678a03b77703d85a85"
  end
  version "3133.0.0"
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
