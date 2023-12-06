require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4104.0.0-darwin-x64.tar.gz"
    sha256 "2bc0f1b9f3af8914588d61ea970d8e598a9f02031624110ca61f982e09145a19"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4104.0.0-darwin-arm64.tar.gz"
      sha256 "9f4ce6150c55cab2b490c4bec51f0ead9f91af99d471a284530415bbdd4947f5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4104.0.0-linux-x64.tar.gz"
    sha256 "0779c7238d964ae119e971c40e2306534930037d90befbf442828003699921bb"
  end
  version "4104.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
