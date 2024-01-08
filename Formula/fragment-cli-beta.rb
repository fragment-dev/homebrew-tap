require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4290.0.0-darwin-x64.tar.gz"
    sha256 "ec18cc223c80be670246faf6b73830fa9b31983d57256dc84e9f3f2212ad9ca4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4290.0.0-darwin-arm64.tar.gz"
      sha256 "c707666c706f4577442ee232bf2a711c10f7fcadba2b23edec2e1b03c8650056"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4290.0.0-linux-x64.tar.gz"
    sha256 "b911fbea102bfe34e9ab069fae0f942445cd0fe9da43742b1c4c9b21b92a032e"
  end
  version "4290.0.0"
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
