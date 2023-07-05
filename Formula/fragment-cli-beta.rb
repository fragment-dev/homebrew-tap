require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3004.0.0-darwin-x64.tar.gz"
    sha256 "51aafd634e924113db76fcbda5e4435484fc00fcfce6a1dbca764de5a95c911d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3004.0.0-darwin-arm64.tar.gz"
      sha256 "91d5a2d6c68a2876873a0954df1bd3413f74c6f400206fc0bfde71675f63abc7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3004.0.0-linux-x64.tar.gz"
    sha256 "de6dcd6f08b0fa46596ee365de8f09c04b640b40a0aad4023193a863d7455284"
  end
  version "3004.0.0"
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
