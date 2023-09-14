require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3560.0.0-darwin-x64.tar.gz"
    sha256 "622144d16328c15ab7fedd604b32d0544f6d905256eca0ed80fca4512c88b22b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3560.0.0-darwin-arm64.tar.gz"
      sha256 "a071df020800d05b294daffe74d0495d16fae8b138557d6708ca923f128f393f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3560.0.0-linux-x64.tar.gz"
    sha256 "9520d7fcd6bd87c1890ba982097c9ac788bed53cf4f408fea1b27f3967eb926c"
  end
  version "3560.0.0"
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
