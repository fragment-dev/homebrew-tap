require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2420.0.0-darwin-x64.tar.gz"
    sha256 "1265fd50fea88296605b40b1d65e3ffc3c76540752969e825ed431896e4ba484"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2420.0.0-darwin-arm64.tar.gz"
      sha256 "0d751e4419c8bd944b0eea04d85a67392af3f35d882dd878f3beb4e13f05172c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2420.0.0-linux-x64.tar.gz"
    sha256 "f08b371bbd5695d019eb2a59a4ce5330fd87db9d353b4831a9f0f603b7711c73"
  end
  version "2420.0.0"
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
