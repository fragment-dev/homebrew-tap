require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4439.0.0-darwin-x64.tar.gz"
    sha256 "3c638dceb945ad04f421e45cb64ca3a7ad85900206f1c74dda911f1b3965541c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4439.0.0-darwin-arm64.tar.gz"
      sha256 "651fc54961172b78afed9b9d19888cc22c7ff1543290c0346fef94b9f8ca0eef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4439.0.0-linux-x64.tar.gz"
    sha256 "15e392b1b0ecf80c265632e47f17e222bc2750f270aa3cf6a4091929e2018e28"
  end
  version "4439.0.0"
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
