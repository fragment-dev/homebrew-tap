require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3931.0.0-darwin-x64.tar.gz"
    sha256 "51d82a62d1afdc0bfb50f8374b8defd734bab122bfd541fb98ec95efbb9da2eb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3931.0.0-darwin-arm64.tar.gz"
      sha256 "7598f916a6a65269fc8471587bf686e2ca40176aab16c338137e23c970983f47"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3931.0.0-linux-x64.tar.gz"
    sha256 "572f695bacb15a3b1cf937c1743cd525a0701a30149c35695ecf11c10b891e3b"
  end
  version "3931.0.0"
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
