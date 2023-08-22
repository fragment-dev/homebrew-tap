require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3355.0.0-darwin-x64.tar.gz"
    sha256 "25b5dd4f018b789fa845eaf0150efbbc25bcf5fd34f70df39cd55187f7bb57ab"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3355.0.0-darwin-arm64.tar.gz"
      sha256 "0dfd93df830b61aaa3cffcd89efd4cef339dabe13490bebdd3357f7aa07a8823"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3355.0.0-linux-x64.tar.gz"
    sha256 "cf089f26e26825eb5830db6586fd14c17929b87802453fe9496d698285a1f538"
  end
  version "3355.0.0"
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
