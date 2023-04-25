require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2519.0.0-darwin-x64.tar.gz"
    sha256 "67e616dc5bc6ec445eec8c7c261decf48d7ce2d30a413cf7fd115438d4932816"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2519.0.0-darwin-arm64.tar.gz"
      sha256 "88d40048ba9f993a836e6389c79ee57c349487c3157eb0811f06e4dbe7da37a8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2519.0.0-linux-x64.tar.gz"
    sha256 "927073aca997c0344824183c9c19d91672cf34838c0ffc74865e54b397ce0de2"
  end
  version "2519.0.0"
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
